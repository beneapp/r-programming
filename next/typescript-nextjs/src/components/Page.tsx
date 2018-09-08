import React, { Component } from "react"
import { MyStore } from "../stores/myStore"
import { observer, inject } from "mobx-react"

interface Props {
  myStore?: MyStore
  title: string
  linkTo: string
}

@inject("myStore")
@observer
export default class Page extends Component<Props> {
  render() {
    const { myStore } = this.props
    return (
      <div>
        this is page
        {myStore.val} {myStore.lastUpdate} {myStore.isServer.toString()}
      </div>
    )
  }
}
