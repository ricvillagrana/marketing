export default class Node {
  constructor(name = '') {
    this.name = name
    this.children = []
    this.node_id = 0
  }

  children  = () => this.children
  name      = () => this.name
  parent    = () => this.node_id

  appendChild = newChildren => this.children.push(newChildren)
  setName     = name => this.name = name
}
