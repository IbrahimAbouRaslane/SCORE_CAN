module.exports = {
  purge: ["./app/**/*.html.erb"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      color: {
        'orange-color':'#E15007',
        'gris-color': '#E15007',
        'vert-color': '#208B3A'
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};