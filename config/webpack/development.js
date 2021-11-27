process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
if (process.env.RAILS_ENV != 'development') environment.splitChunks()
module.exports = environment.toWebpackConfig()
