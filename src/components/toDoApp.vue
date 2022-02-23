<template>
  <div class="app-container">
    <h1 class="main-title">Get Sh*t Done.</h1>

    <form class="input-task-container">
      <input type="text" placeholder="Enter Task" class="input-task-text" v-model="task" />
      <input type="submit" value="Add Task" class="input-task-submit" @click="submitTask"/>
    </form>

    <table class="to-do-table">
      <tr>
        <th class="task-header task-name">Task</th>
        <th class="task-header">Status</th>
        <th class="task-header">Edit Status</th>
        <th class="task-header">Delete Task</th>
      </tr>
      <tr v-for="(task, index) in tasks" :key="index">
        <td class="task-row">{{task.name}}</td>
        <td class="task-row center-icons" v-bind:class="{ 'task-to-do':(task.status === 'to-do'), 'task-in-progress':(task.status === 'in progress'), 'task-complete':(task.status === 'complete') }">{{task.status}}</td>
        <td class="task-row center-icons select-icon" @click="editTask(index)"><span class="fa fa-pen"></span></td>
        <td class="task-row center-icons select-icon" @click="deleteTask(index)"><span class="fa fa-trash"></span></td>
      </tr>
    </table>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        task: "",
        tasks: []
      }
    },
    mounted() {
      if (localStorage.storedTasks) this.tasks = JSON.parse(localStorage.storedTasks);
    },
    methods: {
      storedTasks() {
        localStorage.storedTasks = JSON.stringify(this.tasks);
      },
      editTask(index){
        if(this.tasks[index].status === 'to-do') {
          this.tasks[index].status = 'in progress';
        } else if(this.tasks[index].status === 'in progress') {
          this.tasks[index].status = 'complete';
        } else {
          this.tasks[index].status = 'to-do';
        }
        this.storedTasks();
      },
      submitTask(e){
        e.preventDefault();
        if(this.task.length === 0) return;
        this.tasks.push({
          name:this.task,
          status: "to-do"
        });
        this.storedTasks();
        this.task = "";
      },
      deleteTask(index){
        this.tasks.splice(index, 1);
        this.storedTasks();
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>

  :root {
    --mainOrange: #F5A742;
    --secondOrange: #FFB95E;
    --brown: #A86C1D;
    --darkBlue: #0C72A8;
    --lightBlue: #42B6F5;
  }

  /* latin */
  @font-face {
  font-family: 'Poppins';
  font-style: italic;
  font-weight: 400;
  font-display: swap;
  src: url(https://fonts.gstatic.com/s/poppins/v19/pxiGyp8kv8JHgFVrJJLucHtAOvWDSA.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }

/* latin */
  @font-face {
  font-family: 'Poppins';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url(https://fonts.gstatic.com/s/poppins/v19/pxiEyp8kv8JHgFVrJJfecnFHGPc.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
/* latin */
  @font-face {
  font-family: 'Poppins';
  font-style: normal;
  font-weight: 700;
  font-display: swap;
  src: url(https://fonts.gstatic.com/s/poppins/v19/pxiByp8kv8JHgFVrLCz7Z1xlFd2JQEk.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }

  .app-container {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .main-title {
    font-size: 36px;
    padding: 30px;
    color: var(--secondOrange);
  }

  .input-task-text {
    width: 40vw;
    padding: 3px;
    margin-right: 10px;
    font-size: 18px;
  }

  .input-task-submit {
    padding: 5px 40px;
    background-color: var(--mainOrange);
    color: #F9F7F5;
    border-radius: 5px;
    border: none;
    font-size: 18px;
  }

  .input-task-submit:hover {
    background-color: var(--secondOrange);
    color: #000000;
    cursor: pointer;
  }

  .to-do-table {
    margin-top: 30px;
    border-collapse: collapse;
  }

  .to-do-table, .task-header, .task-row {
    border: 1px #4a4a4a solid;
    background-color: #F9F7F5;
  }

  .task-header, .task-row {
    padding: 5px;
  }

  .task-header {
    font-size: 14px;
  }

  .task-row {
    font-size: 18px;
    padding: 10px 5px;
  }

  .center-icons {
    text-align: center;
  }

  .select-icon {
    cursor: pointer;
  }

  .task-header {
    min-width: 10vw;
  }

  .task-name {
    min-width: 50vw;
  }

  .task-to-do {
    background-color: #FF6347;
  }

  .task-in-progress {
    background-color: var(--secondOrange)
  }

  .task-complete {
    background-color: #9ACD32;
  }

</style>