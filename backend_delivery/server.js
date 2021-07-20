/*
const: constantes
let: variables
*/
const express = require('express')
const http = require('http')
const logger= require('morgan')
const cors= require('cors')
const users = require('./routes/usersRoutes')

// import logger from 'morgan'
// import cors from 'cors'
// import users from './routes/usersRoutes'

const app = express()
const server = http.createServer(app)

/*Rutas*/
const port = process.env.PORT || 3000
app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({
    extended: true
}))
app.use(cors())
app.disable('x-powered-by')
app.set('port', port)

/*
llamando a las rutas
*/
users(app)

server.listen(3000,'192.168.0.106' || 'localhost', function(){
    console.log('App '+process.pid+' iniciada...')
    console.log('App '+port+' iniciada...')
})

app.get('/',(req, res) => {
    res.send('ruta raiz del backend')
})
//error handler
app.use((err,req, res, next) => {
    console.log(err)
    res.status(err.status || 500).send(err.stack)
})

module.exports = {
    app: app,
    server: server
}

//200 - es una respuesta exitosa
//400 - significa que la url no existe
//500 - error interno del servidor