const request = require('supertest')
const expect = require('chai').expect

const app = require('../app')

describe('app.test', function () {
    it('GET / should return the homepage', function (done) {
        request(app)
            .get('/')
            .end(function (err, res) {
                if (err) return done(err)
                expect(res.status).to.eq(200)
                expect(res.header['content-type']).to.include('text/html')
                expect(res.text).to.include('<h1>Hedgehog</h1>')
                done()
            })
    })

    it('GET /healthcheck should return a JSON', function (done) {
        request(app)
            .get('/healthcheck')
            .end(function (err, res) {
                if (err) return done(err)
                expect(res.status).to.eq(200)
                expect(res.header['content-type']).to.include('application/json')
                expect(JSON.parse(res.text).uptime).to.gt(0)
                done()
            })
    })
})
