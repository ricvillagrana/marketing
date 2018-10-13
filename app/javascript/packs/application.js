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
import VCalendar from 'v-calendar'
import 'v-calendar/lib/v-calendar.min.css';

Vue.prototype.$axios = axios;
Vue.prototype.$swal = swal;

// Import of own components
import Login from '../components/sessions/Login'
import Register from '../components/sessions/Register'
import Layout from '../components/layout/Layout'
import SuperadminAdmins from '../components/superadmin/Admins'
import AppModal from '../components/app/AppModal'

// Registration of own components
Vue.use('login', Login)
Vue.use('register', Register)
Vue.use('layout', Layout)
Vue.use('superadmin-admins', SuperadminAdmins)

// Registration of App components
Vue.use('app-modal', AppModal)

Vue.use(TurbolinksAdapter)
Vue.use(Notifications)
Vue.use(VCalendar, {
  firstDayOfWeek: 1
});

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#app',
    components: {
      // Project
      Login, Register, Layout, SuperadminAdmins,
      
      // App
      AppModal
    }
  })
})
