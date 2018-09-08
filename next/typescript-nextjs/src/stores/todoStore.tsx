import RootStore from "./rootStore"
import { action, observable } from "mobx"

interface Todo {
  task: string
  isComplete: boolean
}

class TodoStore {
  rootStore: RootStore

  @observable todos: Todo[] = []
  @observable val = "teststest"

  constructor(rootStore) {
    this.rootStore = rootStore
  }
}

export default TodoStore
