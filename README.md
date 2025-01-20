# AlphaBench Share

A lightweight Nuxt.js application that handles sharing and redirecting of alphabench backtest results with proper meta tags for social media sharing.

## Features

- Redirect service for AlphaBench backtest results
- Social media meta tags for shared backtest results
- SEO-friendly backtest result pages

## Setup

```bash
# install dependencies
npm install

# serve with hot reload at localhost:3000
npm run dev

# build for production
npm run build

# generate static project
npm run generate
```

## Environment Variables

Create a `.env` file in the root directory with the following variables:

```
API_BASE_URL=your_api_base_url
```

## Deployment

This project is configured for deployment on Netlify. The `netlify.toml` configuration file is included in the repository.

## Built With

- [Nuxt.js](https://nuxtjs.org/) - The Vue.js Framework
- [@nuxtjs/axios](https://axios.nuxtjs.org/) - HTTP client
