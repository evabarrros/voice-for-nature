<template>
  <div>
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
  </div>
</template>

<script>
import { TresCanvas } from '@tresjs/core'
import { OrbitControls, Environment } from '@tresjs/cientos'

export default {
  name: 'BackgroundViewer',

  components: {
    TresCanvas,
    OrbitControls,
    Environment
  },

  data: () => ({
    environmentFiles:  ['/px.jpg', '/nx.jpg', '/py.jpg', '/ny.jpg', '/pz.jpg', '/nz.jpg']
  })
}
</script>

<style>
</style>