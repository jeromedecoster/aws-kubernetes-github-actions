const nunjucks = require('nunjucks')
const express = require('express')

const app = express()

nunjucks.configure('views', {
    express: app,
    autoescape: false,
    noCache: true
})

app.set('view engine', 'njk')
app.use(express.static('public'))
app.locals.version = require('./package.json').version

app.get('/', async (req, res) => {
    res.render('index')
})

app.get('/healthcheck', (req, res) => {
    res.json({ uptime: process.uptime() })
})

module.exports = app
