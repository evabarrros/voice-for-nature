<template>
  <div>
    <TresCanvas window-size clear-color="#82DBC5">
      <TresPerspectiveCamera ref="camera"/>
      <OrbitControls :enablePan="false" :enableZoom="false"/>
      <Suspense>
        <Environment
          background
          :files="locations[currentLocation].image"
        />
      </Suspense>
      <TresScene>
        <TresDirectionalLight
          :position="[0, 8, 4]"
          :intensity="0.2"
          cast-shadow
        />
        <TresMesh
          v-for="location in locations"
          :key="location.id"
          :position="location.position"
          :visible="location.id !== currentLocation"
          @click="currentLocation = location.id"
          @pointer-enter="onPointerEnter"
          @pointer-leave="onPointerLeave"
          >
          <TresSphereGeometry />
          <TresMeshToonMaterial color="#FBB03B" />
        </TresMesh>
      </TresScene>
    </TresCanvas>
  </div>
</template>

<script>
import { OrbitControls, Environment } from '@tresjs/cientos'
import { TresCanvas } from '@tresjs/core'
export default {
  name: 'BackgroundViewer',

  components: {
    TresCanvas,
    OrbitControls,
    Environment
  },
  data () {
    return {
      currentLocation: "loc1",
      locations: {
        loc1: {
          id: "loc1",
          image: "./deltapond2.hdr",
          position: [0, 0, 0]
        },
        loc2: {
          id: "loc2",
          image: "./deltapond1.hdr",
          position: [-200, 0, 100]
        },
        loc3: {
          id: "loc3",
          image: "./deltapond3.hdr",
          position: [-100, 0, 200]
        }
      }
    }
  },
  mounted () {
    console.log(this.$refs.camera)
  },
  methods: {
    onPointerEnter(ev) {
      if (ev) {
        ev.object.material.color.set('#1CEDDC');
      }
    },
    onPointerLeave(ev) {
      if (ev) {
        ev.object.material.color.set('#efefef')
      }
    },
    onClick(ev) {
      console.log(ev)
      if (ev) {
        ev.object.material.color.set('#008080');
      }
    }
  }
}
</script>

<style>
</style>