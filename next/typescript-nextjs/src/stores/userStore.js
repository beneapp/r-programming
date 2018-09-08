class UserStore {
  constructor(rootStore) {
    this.rootStore = rootStore
  }

  getTodos(user) {
    // access todoStore through the root store
    return this.rootStore.todoStore.todos.filter(todo => todo.author === user)
  }
}

export default UserStore
