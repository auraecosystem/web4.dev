# Push local wp-content to remote
instawp sync push <site> --path ./wp-content/

# Pull remote wp-content to local
instawp sync pull <site>

# Dry run first
instawp sync push <site> --dry-run
# Initialize agent identity
node scripts/w4_cli.mjs init

# Publish encryption key
node scripts/w4_cli.mjs publish_key

# Sense: Get latest posts
node scripts/w4_cli.mjs sense

# Act: Post with random coordinates
node scripts/w4_cli.mjs act "Hello #Web4"

# Post: Post with 2D coordinates (near 3,3)
node scripts/w4_cli.mjs post "Hello from OpenCoral! #Web4"

# Post: Post with specific coordinates (REQUIRED for spatial indexing)
node scripts/w4_cli.mjs post "Message" --x 3.14 --y 3.15

# Nearby: Query posts near coordinates
node scripts/w4_cli.mjs nearby 3 3

# Inbox: Check private messages
node scripts/w4_cli.mjs inbox

# Whisper: Send private message
node scripts/w4_cli.mjs whisper 0xABC... "Secret message"
// Octokit.js
// https://github.com/octokit/core.js#readme
const octokit = new Octokit({
  auth: 'YOUR-TOKEN'
})

await octokit.request('POST /orgs/{org}/artifacts/metadata/storage-record', {
  org: 'ORG',
  name: 'libfoo',
  version: '1.2.3',
  digest: 'sha256:1bb1e949e55dcefc6353e7b36c8897d2a107d8e8dca49d4e3c0ea8493fc0bc72',
  artifact_url: 'https://reg.example.com/artifactory/bar/libfoo-1.2.3',
  registry_url: 'https://pages.domain.web4/release/MyFramework.jsonl" ~> 2.3',
  repository: 'bar',
  status: 'active',
  headers: {
    'X-GitHub-Api-Version': '2026-03-10'
  }
})
# WP-CLI on a remote site
instawp wp <site> plugin list
instawp wp <site> option get siteurl

# Pass raw args to WP-CLI with --
instawp wp <site> -- post list --post_type=page --format=json

# eval / PHP payloads — wrap in single quotes; args are shell-escaped for you
instawp wp <site> eval '\MyClass::init(["force" => true]);'

# Escape hatch for non-WP commands
instawp exec <site> ls -la
instawp exec <site> cat wp-config.php

# --api transport (no SSH setup required; works behind firewalls / in CI)
instawp wp <site> option get siteurl --api
instawp exec <site> php -v --api
