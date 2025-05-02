module.exports = {
  content: [
    "./app/views/**/*.{html,html.erb,erb}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/assets/stylesheets/**/*.css"
  ],
  theme: {
    extend: {
      colors: {
        'custom-blue': '#1fb6ff',
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
    },
  },
  plugins: [
    require("daisyui")
  ],
  daisyui: {
    themes: ["light", "dark", "cupcake"],
    darkTheme: "dark",
    base: true,
    styled: true,
    utils: true,
    logs: true,
  }
}
