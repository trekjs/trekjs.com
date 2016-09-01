import nodeResolve from 'rollup-plugin-node-resolve'
import commonjs from 'rollup-plugin-commonjs'
import buble from 'rollup-plugin-buble'
import path from 'path'

export default {
  plugins: [
    nodeResolve({ jsnext: true, main: true }),
    commonjs({
      include: 'node_modules/**',
      ignoreGlobal: true
    }),
    buble()
  ]
}
