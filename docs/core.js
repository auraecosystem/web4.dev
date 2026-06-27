// Octokit.js
// https://github.com/octokit/core.js#readme
const octokit = new Octokit({
  auth: 'YOUR-TOKEN'
})

await octokit.request('POST /orgs/{org}/artifacts/metadata/deployment-record', {
  org: 'ORG',
  name: 'awesome-image',
  digest: 'sha256:1bb1e949e55dcefc6353e7b36c8897d2a107d8e8dca49d4e3c0ea8493fc0bc72',
  status: 'deployed',
  logical_environment: 'prod',
  physical_environment: 'pacific-east',
  cluster: 'moda-1',
  deployment_name: 'deployment-pod',
  tags: {
    'data-access': 'sensitive'
  },
  headers: {
    'X-GitHub-Api-Version': '2026-03-10'
  }
})
