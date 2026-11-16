// Encrypts data.json into data.enc so the public repo never holds roster details in plain text.
//   TEAM_PASSWORD=... node build.js encrypt path/to/data.json   -> writes data.enc
//   TEAM_PASSWORD=... node build.js decrypt > data.json          -> reads data.enc
// The page unlocks data.enc in the browser with the same password (PBKDF2-SHA256 + AES-GCM).
const crypto = require('crypto'), fs = require('fs'), path = require('path');
const pw = process.env.TEAM_PASSWORD, file = path.join(__dirname, 'data.enc'), ITER = 250000;
if (!pw) { console.error('Set TEAM_PASSWORD'); process.exit(1); }
const key = salt => crypto.pbkdf2Sync(pw, salt, ITER, 32, 'sha256');
const [cmd, src] = process.argv.slice(2);
if (cmd === 'encrypt') {
  const salt = crypto.randomBytes(16), iv = crypto.randomBytes(12);
  const c = crypto.createCipheriv('aes-256-gcm', key(salt), iv);
  const ct = Buffer.concat([c.update(fs.readFileSync(src)), c.final(), c.getAuthTag()]);
  fs.writeFileSync(file, JSON.stringify({ iter: ITER, salt: salt.toString('base64'), iv: iv.toString('base64'), ct: ct.toString('base64') }) + '\n');
} else if (cmd === 'decrypt') {
  const e = JSON.parse(fs.readFileSync(file)), ct = Buffer.from(e.ct, 'base64');
  const d = crypto.createDecipheriv('aes-256-gcm', key(Buffer.from(e.salt, 'base64')), Buffer.from(e.iv, 'base64'));
  d.setAuthTag(ct.subarray(-16));
  process.stdout.write(Buffer.concat([d.update(ct.subarray(0, -16)), d.final()]));
} else { console.error('Usage: node build.js encrypt data.json | decrypt'); process.exit(1); }
