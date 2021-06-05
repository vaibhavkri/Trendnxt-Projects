$str = "word2"

switch -regex($str) {
    "word2" {"Exact " + $_; break}
    "w.*" {"Pattern match first letter " + $_ ; break}
    default {"Default " + $_; break}
}
