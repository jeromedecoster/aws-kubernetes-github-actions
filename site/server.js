const app = require('./app.js')

const WEBSITE_PORT = 3000

app.listen(WEBSITE_PORT, () => { 
    console.log(`Listening on port ${WEBSITE_PORT}`) 
})
