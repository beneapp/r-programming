import UserStore from "./userStore"
import TodoStore from "./todoStore"

class RootStore {
  lastUpdate: string
  isServer: boolean

  userStore: UserStore
  todoStore: TodoStore

  constructor(isServer, lastUpdate) {
    this.isServer = isServer
    this.lastUpdate = lastUpdate
    this.userStore = new UserStore(this)
    this.todoStore = new TodoStore(this)
  }
}

export default RootStore
