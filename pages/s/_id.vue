<template>
  <div class="redirect-container">
    <div v-if="error" class="error-message">
      {{ error }}
    </div>
    <div v-else class="redirect-message">
      Redirecting to AlphaBench...
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
      error({ 
        statusCode: 404, 
        message: 'The requested backtest data could not be found.'
      })
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
        { hid: 'og:title', property: 'og:title', content: title },
        { hid: 'og:description', property: 'og:description', content: description },
        { hid: 'og:image', property: 'og:image', content: image },
        { hid: 'og:url', property: 'og:url', content: url },
        { hid: 'og:type', property: 'og:type', content: 'website' },
        
        // Twitter Card
        { hid: 'twitter:card', name: 'twitter:card', content: 'summary_large_image' },
        { hid: 'twitter:title', name: 'twitter:title', content: title },
        { hid: 'twitter:description', name: 'twitter:description', content: description },
        { hid: 'twitter:image', name: 'twitter:image', content: image }
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