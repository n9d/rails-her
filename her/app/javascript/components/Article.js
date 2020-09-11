import React,{
  useState
} from "react"
import PropTypes from "prop-types"

const Article = (props) => {
  const [article,setArticle] = useState({id:1});
  return (
      <React.Fragment>
        <input type="text" name="id" label="id" onChange={(e)=>getArticle(e.target.value,setArticle)} /> 
        <Foo id={article.id} />
      </React.Fragment>
  )
}

const getArticle = (id,func) => {
  console.dir(id)
  func({id:id})
}

const Foo = (props) => {
  return (
    <div>
      <p> id: {props.id} </p>
    </div>
  )
}

export default Article
