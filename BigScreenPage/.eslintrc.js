module.exports = {
    root: true,
    parserOptions: {
        parser: '@typescript-eslint/parser',
        ecmaVersion: 2020,
        sourceType: 'module',
        jsxPragma: 'React',
        ecmaFeatures: {
          jsx: true,
        },
      },
    extends: [
        "plugin:vue/vue3-recommended",
        "plugin:vue/vue3-strongly-recommended",
        'plugin:vue/essential',
        "plugin:vue/recommended",  
        'eslint:recommended',
        "prettier"
    ],  
    parser: 'vue-eslint-parser',
    env: {
      browser: true,
      node: true,
      es6: true
    },
    rules: {
      'vue/script-setup-uses-vars': 'off',
      '@typescript-eslint/no-empty-function': 'off',
      'vue/custom-event-name-casing': 'off',
      'no-use-before-define': 'off',
      'generator-star-spacing': 'off', 
      'vue/no-ref-as-operand':'off',
      'no-console': 'off',
      'no-unused-vars': [
        'error',
        // 解决 setup 问题
        { varsIgnorePattern: '.*', args: 'none' }
      ],
      'key-spacing': ['off', { 'beforeColon': false, 'afterColon': true }]
    }
  };