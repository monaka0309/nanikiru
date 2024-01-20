module.exports = {
  theme: {
    extend: {
      height: {
        '60vh': '60vh',
        '50vh': '50vh'
      }
    }
  },
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require("daisyui")
  ]
}
