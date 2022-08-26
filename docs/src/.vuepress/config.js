const { description } = require('../../package')

// Ref：https://v1.vuepress.vuejs.org/config/
module.exports = {

  // Basic page info
  title: 'inspec-cisco-nexus',
  description: description,
  base: "/inspec-cisco-nexus/",

  //  Extra tags to be injected to the page HTML `<head>`
  head: [
    ['meta', { name: 'theme-color', content: '#3eaf7c' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }]
  ],

  //  Theme configuration, here is the default theme configuration for VuePress.
  themeConfig: {
    repo: 'github.io/trickyearlobe/inspec-cisco-nexus',
    editLinks: false,
    docsDir: 'docs',
    editLinkText: '',
    lastUpdated: false,
    nav: [
      {
        text: 'Getting Started',
        link: '/inspec/',
      },
      {
        text: 'Custom Resources',
        link: '/resources/'
      },
      {
        text: 'Helpful Links',
        items: [
          {
            text: 'Cisco Virtual Nexus Images',
            link: 'https://software.cisco.com/download/home/286312239/type/282088129/release/10.3(1)'
          },
          {
            text: 'Cisco Nexus CLI reference',
            link: 'https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus9000/sw/93x/command/reference/config/b_N9K_Config_Commands_93x/b_N9K_Config_Commands_93x_chapter_01.html'
          },
          {
            text: 'Chef - Learn Inspec',
            link: 'https://learn.chef.io/courses/course-v1:chef+Inspec101+Perpetual/about'
          },
          {
            text: 'Chef - Inspec docs',
            link: "https://docs.chef.io/inspec/"
          },
        ]
      }
    ],

    sidebarDepth: 2,
    sidebar: {
      '/inspec/': [
          '/inspec/',
          '/inspec/setup',
          '/inspec/exampleProfile',
      ],
      '/resources/': [
          '/resources/',
          '/resources/nexus_command',
          '/resources/nexus_ntp_peers',
      ]
    }
  },

  // Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
  plugins: [
    '@vuepress/plugin-back-to-top',
    '@vuepress/plugin-medium-zoom',
  ],
  markdown: {
    lineNumbers: false,
  }
}
