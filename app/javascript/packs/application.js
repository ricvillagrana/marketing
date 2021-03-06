/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Notifications from 'vue-notification'
import axios from 'axios'
import swal from 'sweetalert2'
import moment from 'moment'
import * as ActiveStorage from 'activestorage'
import ActionCable from 'actioncable'

ActiveStorage.start()

Vue.use(TurbolinksAdapter)
Vue.use(Notifications)

const updateUser = () => {
  Vue.prototype.$user = JSON.parse(localStorage.getItem('user'))
}

Vue.prototype.$fetchUser = function () {
  axios.get('/current_user.json')
    .then(({data}) => {
      localStorage.setItem('user', JSON.stringify(data.user))
      updateUser()
    })
    .catch(err => swal({
      type: 'error',
      title: 'Error',
      text: 'Algo salió mal al recuperar tus datos, recarga la página.'
    }))
}
Vue.prototype.$user = JSON.parse(localStorage.getItem('user'))
Vue.prototype.$userWillUpdate = () => localStorage.clear()
Vue.prototype.$axios = axios
Vue.prototype.$swal = swal

moment.locale('es')
Vue.prototype.$moment = moment

Vue.prototype.$base_url = window.location.origin
Vue.prototype.$redirect = path => window.location = path

Vue.prototype.$containsLink = message => {
  const expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
  const regex = new RegExp(expression);
  return regex.test(message)
}

Vue.prototype.$storage = function (index, value = null) {
  if (value === null) {
    return JSON.parse(localStorage.getItem(index))
  } else {
    return localStorage.setItem(index, JSON.stringify(value))
  }
}

Vue.prototype.$guidGenerator = () => {
    const S4 = function() {
       return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
    };
    return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
}

Vue.prototype.$inputTime = function (time) {
  return moment(time).utcOffset(-6).format('HH:mm:ss')
}
Vue.prototype.$time = function (time) {
  return moment(time).utcOffset(-6).format('h:mm:ss A')
}
Vue.prototype.$date = function (date) {
  return moment(date).utcOffset(-6).format('DD/MM/YYYY')
}
Vue.prototype.$dateText = function (dateUnformat) {
  const date = moment(dateUnformat).utcOffset(-6)
  const day = date.date()
  const month = date.month()
  const year = date.year()
  let monthText = ''
  switch (month + 1) {
    case 1:
      monthText = 'Enero'
      break
    case 2:
      monthText = 'Febrero'
      break
    case 3:
      monthText = 'Marzo'
      break
    case 4:
      monthText = 'Abril'
      break
    case 5:
      monthText = 'Mayo'
      break
    case 6:
      monthText = 'Junio'
      break
    case 7:
      monthText = 'Julio'
      break
    case 8:
      monthText = 'Agosto'
      break
    case 9:
      monthText = 'Septiembre'
      break
    case 10:
      monthText = 'Octubre'
      break
    case 11:
      monthText = 'Noviembre'
      break
    case 12:
      monthText = 'Diciembre'
      break

    default:
      monthText = '?'
      break
  }
  return `${day} de ${monthText} de ${year}`
}
Vue.prototype.$datetime = function (datetime) {
  return moment(datetime).utcOffset(0).format('DD/MM/YYYY h:mm:ss A')
}

let token = document.head.querySelector('meta[name="csrf-token"]')
Vue.prototype.$axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content

// Import of own components
import Login from '../components/sessions/Login'
import Register from '../components/sessions/Register'
import Layout from '../components/layout/Layout'
import Dashboard from '../components/layout/Dashboard/'

// Superadmin
import SuperadminCompanies from '../components/roles/superadmin/companies'
import SuperadminAdmins from '../components/roles/superadmin/admins'
// Admin
import AdminCompanies from '../components/roles/admin/companies'
import AdminUsers from '../components/roles/admin/users'
import AdminCampaigns from '../components/roles/admin/campaigns'
import AdminCampaignsShow from '../components/roles/admin/campaigns/show'

// Community Manager
import CommunityManagerCampaigns from '../components/roles/community_manager/campaigns/'
import CommunityManagerCampaignsShow from '../components/roles/community_manager/campaigns/Show'
import CommunityManagerPublications from '../components/roles/community_manager/publications/'
import CommunityManagerPublicationsShow from '../components/roles/community_manager/publications/Show'

// Designer
import DesignerPublications from '../components/roles/designer/publications/'
import DesignerPublicationsShow from '../components/roles/designer/publications/Show'

// Content Generator
import ContentGeneratorPublications from '../components/roles/content_generator/publications/'
import ContentGeneratorPublicationsShow from '../components/roles/content_generator/publications/Show'

// Import of App Components
import AppModal from '../components/app/AppModal'
import AppCard from '../components/app/AppCard'

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#app',
    components: {
      // Project
      Login, Register, Layout, Dashboard,

      // Superadmin
      SuperadminAdmins, SuperadminCompanies,

      // Admin
      AdminCompanies, AdminUsers, AdminCampaigns, AdminCampaignsShow,

      // Community Manager
      CommunityManagerCampaigns, CommunityManagerCampaignsShow, CommunityManagerPublications, CommunityManagerPublicationsShow,

      // Designer
      DesignerPublications, DesignerPublicationsShow,

      // Content Generator
      ContentGeneratorPublications, ContentGeneratorPublicationsShow,

      // App
      AppModal, AppCard
    }
  })
})
