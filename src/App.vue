<template>
  <v-app>
    <v-main>
      <TresCanvas window-size clear-color="#82DBC5">
        <TresPerspectiveCamera :position="[9, 9, 9]" />
        <OrbitControls />
        <Suspense>
          <Environment
            background
            :files="environmentFiles"
            path="https://raw.githubusercontent.com/Tresjs/assets/main/textures/environmentMap"
          />
        </Suspense>
      </TresCanvas>
    </v-main>
  </v-app>
</template>

<script>
import { TresCanvas } from '@tresjs/core'
import { OrbitControls, Environment } from '@tresjs/cientos';

export default {
  name: 'App',

  components: {
    TresCanvas,
    OrbitControls,
    Environment
  },

  data: () => ({
    environmentFiles:  ['/px.jpg', '/nx.jpg', '/py.jpg', '/ny.jpg', '/pz.jpg', '/nz.jpg']
  }),

  mounted () {
    // this.scene = useGLTF('https://raw.githubusercontent.com/Tresjs/assets/main/models/gltf/realistic-pokeball/scene.gltf', { draco: true })
  }
}
</script>
