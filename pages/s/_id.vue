<template>
  <div class="redirect-container">
    <div v-if="error" class="error-message">
      <span>{{ error }}</span>
    </div>
    <div v-else class="redirect-message">
      <span>Redirecting to AlphaBench...</span>
    </div>
  </div>
</template>

<script>
export default {
  name: 'BacktestSharePage',
  
  async asyncData({ $axios, params, error }) {
    try {
      const backtest = await $axios.$get(`/backtests/s/${params.id}`)
      return { backtest }
    } catch (err) {
      return {
        error: 'The requested backtest data could not be found.',
        backtest: null
      }
    }
  },

  data() {
    return {
      error: null
    }
  },

  head() {
    if (!this.backtest) return {}

    const title = `${this.backtest.strategy_title} - Backtest Results`
    const description = `Backtest results for ${this.backtest.instrument_symbol} from ${this.backtest.from_date} to ${this.backtest.to_date}`
    const url = `${this.$config.mainAppURL}/results/${this.backtest.id}`
    const image = `${this.backtest.preview_image_url}`

    return {
      title,
      meta: [
        // Open Graph
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        // Open Graph
        { name: 'og:title', content: title },
        { name: 'og:description', content: description },
        { name: 'og:image', content: image },
        { name: 'og:url', content: url },
        { name: 'og:type', content: 'website' },
        
        // Twitter Card
        { name: 'twitter:card', content: 'summary_large_image' },
        { name: 'twitter:title', content: title },
        { name: 'twitter:description', content: description },
        { name: 'twitter:image', content: image }
      ]
    }
  },

  mounted() {
    if (this.backtest) {
      setTimeout(() => {
        window.location.href = `${this.$config.mainAppURL}/results/${this.backtest.id}`
      }, 1500)
    }
  }
}
</script>

<style scoped>
.redirect-container {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding: 20px;
}

.redirect-message {
  font-size: 1.2rem;
  color: #666;
}

.error-message {
  color: #dc3545;
  font-size: 1.2rem;
}
</style> 