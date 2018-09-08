import { observable } from "mobx"

let store = null

export class MyStore {
  @observable val = "kakakakakakstring test"
  @observable lastUpdate: string
  @observable isServer: boolean

  constructor(isServer, lastUpdate) {
    this.isServer = isServer
    this.lastUpdate = lastUpdate
  }
}

export default function initializeStore(isServer, lastUpdate = Date.now()) {
  if (isServer) {
    return new MyStore(isServer, lastUpdate)
  } else {
    if (store === null) {
      store = new MyStore(isServer, lastUpdate)
    }
    return store
  }
}
