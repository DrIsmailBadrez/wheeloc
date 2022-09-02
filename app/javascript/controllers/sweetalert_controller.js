import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static targets = ["delete"]
  static values = { path: String }
  connect() {

  }

  delete (event) {
    // console.log(event)
    const path =
    event.preventDefault();
      Swal.fire({
      title: "You're about to delete an offer, are you sure ?",
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        console.log(this.deleteTarget.data, "treter");
        // fetch(this.urlValue).then(e =>{
        //   document.location.reload();
        // })
      }
    })
  }
}
