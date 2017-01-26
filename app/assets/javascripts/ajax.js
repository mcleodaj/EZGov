/* global $ */

$(document).ready(function () {
  personClicker()
  billClicker()
  subSubmit()
  unsubSubmit()
})

var personClicker = function () {
  $('.col-1-3').on('click', 'a.person-link', function (event) {
    event.preventDefault()
    $('.col-2-3').empty()
    var id = $(this).attr('href')
    var fullPage = '<a href=' + id + '><p><b>View full page and voting history</b></p></a>'
    $.ajax({
      method: 'GET',
      url: id
    })
    .done(function (partial) {
      var html = $(partial)
      var toAppend = $(html).find('.grab')[0]
      $('.col-2-3').append(toAppend)
      $('.text').append(fullPage)
    })
    .fail(function () {
      console.log('request failed')
    })
  })
}

var billClicker = function () {
  $('.container').on('click', 'a.bill-link', function (event) {
    event.preventDefault()
    $('.for-show').empty()
    var id = $(this).attr('href')
    $.ajax({
      method: 'GET',
      url: id
    })
    .done(function (partial) {
      var html = $(partial)
      var toAppend = $(html).find('.grab')[0]
      $('.for-show').append(toAppend)
    })
    .fail(function () {
      console.log('request failed')
    })
  })
}

var subSubmit = function () {
  $('.container').on('submit', '.sub-form', function (event) {
    event.preventDefault()
    var url = $(this).attr('action')
    $.ajax({
      method: 'POST',
      url: url
    })
    .done(function (partial) {
      var html = $(partial)
      var toAppend = $(html).find('.unsub-form')[0]
      $(event.target.parentNode).empty().append(toAppend)
    })
    .fail(function () {
      console.log('request failed')
    })
  })
}

var unsubSubmit = function () {
  $('.container').on('submit', '.unsub-form', function (event) {
    event.preventDefault()
    var url = $(this).attr('action')
    $.ajax({
      method: 'DELETE',
      url: url
    })
    .done(function (partial) {
      var html = $(partial)
      var toAppend = $(html).find('.sub-form')[0]
      $(event.target.parentNode).empty().append(toAppend)
    })
    .fail(function () {
      console.log('request failed')
    })
  })
}
