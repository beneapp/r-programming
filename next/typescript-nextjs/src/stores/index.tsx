import RootStore from "./rootStore"

let store = null

export function initializeStore(isServer, lastUpdate = Date.now()) {
  if (isServer) {
    return new RootStore(isServer, lastUpdate)
  } else {
    if (store === null) {
      store = new RootStore(isServer, lastUpdate)
    }
    return store
  }
}
