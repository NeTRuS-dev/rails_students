<template>
  <div id="app" class="mt-5">
    <a class="btn btn-success my-3" href="/users/get-all">Скачать таблицу</a>
    <table class="table">
      <thead>
      <tr>
        <td>ФИО</td>
        <td>Телефон</td>
        <td>Адрес</td>
        <td>Дата рождения</td>
      </tr>
      </thead>
      <tbody>
      <tr v-for="user in users" :key="user.id">
        <td>{{ user.lastname }} {{ user.name }} {{ user.patronymic }}</td>
        <td>{{ user.phone }}</td>
        <td>{{ user.address }}</td>
        <td>{{ user.birth_date }}</td>
      </tr>
      </tbody>
    </table>
    <paginate :container-class="'pagination'"
              :page-class="'page-item'"
              :page-link-class="'page-link'"
              :prev-class="'page-item'"
              :prev-link-class="'page-link'"
              :next-class="'page-item'"
              :next-link-class="'page-link'"
              :page-count="total_count"
              :click-handler="clickCallback">
    </paginate>
  </div>
</template>

<script>

export default {
  data: function () {
    return {
      users: [],
      token: undefined,
      total_count: 1,
      current_page: 1,
    }
  },
  methods: {
    clickCallback(pageNum) {
      this.current_page = pageNum
      this.updatePage()
    },
    updatePage() {
      fetch('/users/get-all', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': this.token
        },
        body: JSON.stringify({
          page: this.current_page
        })
      }).then((response) => {
        return response.json();
      })
          .then((data) => {
            this.users = data.users
            this.total_count = data.total_count
          });
    }
  },
  mounted() {
    this.token = document.querySelector('meta[name="csrf-token"]').content;
    this.updatePage()

  }
}
</script>

<style lang="scss" scoped>
</style>
