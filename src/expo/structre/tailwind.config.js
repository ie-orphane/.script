/** @type {import(tailwindcss).Config} */
module.exports = {
  content: ["./App.{js,jsx,ts,tsx}", "./app/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#002d55",
        dark: "#101720",
        light: "#f8fcff",
      },
    },
  },
  plugins: [],
};
