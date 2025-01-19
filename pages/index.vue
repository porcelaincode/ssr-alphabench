<template>
  <div class="redirect-container">
    Redirecting to AlphaBench...
  </div>
</template>

<script>
export default {
  name: 'IndexPage',
  mounted() {
    window.location.href = this.$config.mainAppURL
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
  color: #666;
  font-size: 1.2rem;
}
</style>
