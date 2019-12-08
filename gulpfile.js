const { series, src, dest } = require('gulp');
const rm = require('del');

function clean() {
    return Promise.resolve(rm([
        'functions/__sapper__/build'
    ]));
}

function build() {
    return src('__sapper__/build/**/*')
        .pipe(dest('functions/__sapper__/build'));
}

exports.build = build;
exports.clean = clean;
exports.default = series(clean, build);