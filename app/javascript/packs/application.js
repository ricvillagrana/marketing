/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
setTimeout(()=> {},99999999999)
import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Notifications from 'vue-notification'
import axios from 'axios'
import swal from 'sweetalert2'
import moment from 'moment'

import Chat from '../classes/Chat'

Vue.use(TurbolinksAdapter)
Vue.use(Notifications)

Vue.prototype.$axios = axios;
Vue.prototype.$swal = swal;
Vue.prototype.$moment = moment;
Vue.prototype.$chat = Chat
Vue.prototype.$base_url = window.location.origin
Vue.prototype.$redirect = path => window.location = path 
Vue.prototype.$inputTime = function (time) {
  return moment(time).utcOffset(0).format('HH:mm:ss')
}
Vue.prototype.$time = function (time) {
  return moment(time).utcOffset(0).format('h:mm A')
}
Vue.prototype.$date = function (date) {
  return moment(date).utcOffset(0).format('DD/MM/YYYY')
}
Vue.prototype.$datetime = function (datetime) {
  return moment(datetime).utcOffset(0).format('DD/MM/YYYY h:mm:ss A')
}
Vue.prototype.$store = function (index, payload = null){
  if (payload) {
    // JSON.stringify convert a Object to String
    return window.localStorage.setItem(index, JSON.stringify(payload))
  } else {
    // JSON.stringify convert a String to Object
    let chats = JSON.parse(window.localStorage.getItem(index))
    chats = chats.map(chat => {
      chat.__proto__ = Chat.prototype
      return chat
    })
    return chats
  }
}

let token = document.head.querySelector('meta[name="csrf-token"]');
Vue.prototype.$axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;

// Import of own components
import Login from '../components/sessions/Login'
import Register from '../components/sessions/Register'
import Layout from '../components/layout/Layout'

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

// Import of App Components
import AppModal from '../components/app/AppModal'
import AppCard from '../components/app/AppCard'

// Registration of own components
Vue.use('login', Login)
Vue.use('register', Register)
Vue.use('layout', Layout)

// Superadmin
Vue.use('superadmin-admins', SuperadminAdmins)
Vue.use('superadmin-companies', SuperadminCompanies)

// Admin
Vue.use('admin-companies', AdminCompanies)
Vue.use('admin-users', AdminUsers)
Vue.use('admin-campaigns', AdminCampaigns)
Vue.use('admin-campaigns-show', AdminCampaignsShow)

// Community Manager
Vue.use('community-manager-campaigns', CommunityManagerCampaigns)
Vue.use('community-manager-campaigns-show', CommunityManagerCampaignsShow)
Vue.use('community-manager-publications', CommunityManagerPublications)
Vue.use('community-manager-publications-show', CommunityManagerPublicationsShow)

// Registration of App components
Vue.use('app-modal', AppModal)
Vue.use('app-card', AppCard)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#app',
    components: {
      // Project
      Login, Register, Layout, 
      
      // Superadmin
      SuperadminAdmins, SuperadminCompanies,

      // Admin
      AdminCompanies, AdminUsers, AdminCampaigns, AdminCampaignsShow,
      
      // Community Manager
      CommunityManagerCampaigns, CommunityManagerCampaignsShow, CommunityManagerPublications, CommunityManagerPublicationsShow,

      // App
      AppModal, AppCard
    }
  })
})
