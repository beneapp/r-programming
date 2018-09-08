import Link from "next/link"
import styled from "styled-components"

const StyledDiv = styled.div`color: yellow;`
const Title = styled.h1`
  color: red;
  font-size: 50px;
`

export default () =>
  <div>
    Hello World.{" "}
    <Link href="/about">
      <a>About</a>
    </Link>
    <StyledDiv>styled - div</StyledDiv>
    <Title>My page</Title>
  </div>
