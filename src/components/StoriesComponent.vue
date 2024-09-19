<template>
  <Scrollama
    class="stories"
    :debug="true"
    :offset="0.5"
  >
    <div>
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quod blanditiis atque est minima incidunt ab impedit. Natus, soluta consectetur culpa non sint pariatur repellat quia, dolorem quo doloribus excepturi!
    </div>
    <div>
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quod blanditiis atque est minima incidunt ab impedit. Natus, soluta consectetur culpa non sint pariatur repellat quia, dolorem quo doloribus excepturi!
    </div>
  </Scrollama>
</template>

<script>
export default {
  name: 'BackgroundViewer',

  data: () => ({
  }),

  mounted () {
  }
}
</script>

<style>
.stories {
   position: sticky;
   top: 0;
   z-index: 2;
   width: 30vw;
   min-width: 150px;
   display: block;
   justify-content: right;
}
</style>