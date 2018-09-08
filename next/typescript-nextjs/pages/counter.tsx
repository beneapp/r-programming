import React, { Component } from "react"
import { Provider } from "mobx-react"
import Page from "components/Page"
import MyStore from "../src/stores/myStore"

export default class Counter extends Component {
  static async getInitialProps(ctx) {
    const isServer = !!ctx.req
    const myStore = MyStore(isServer)
    return {
      myStore: myStore
    }
  }
  render() {
    const { props } = this as any
    const { myStore } = props
    return (
      <Provider myStore={myStore}>
        <Page title="index Page" linkTo="/other" />
      </Provider>
    )
  }
}
