<template>
  <div id="app">
    <ToDo/>
  </div>
</template>

<script>
import ToDo from './components/toDoApp.vue'

export default {
  name: 'App',
  components: {
    ToDo
  }
}
</script>

<style>

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font-family: 'Poppins', sans-serif;
	vertical-align: baseline;
}

article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}

#app {
  min-height: 100vh;
  height: 100%;
  width: 100%;
  background-color: #D3C8C2;
  background-image: url("./assets/pexels-mike-sember-6043246.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}

</style>