require('dotenv').config();

module.exports = {
    apps: [{
      name: 'alphabench-share',
      script: 'npm',
      args: 'start',
      env: {
        NODE_ENV: 'production'
      },
      env_file: path.resolve(__dirname, '.env')
    }]
  }