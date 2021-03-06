Template.contributor.contributor = ->
  contributorData = Meteor.users.findOne Session.get('contributorId')
  if not contributorData
    contributorData = Meteor.users.findOne({'profile.name': Session.get('contributorId')})
  contributor = new Contributor(contributorData)
  document.title = "#{contributor.name()} | devdev.io"
  contributor

Template.contributor.events
  'click .not-implemented': (event) ->
    alertify.log '<strong>Coming soonish...</strong> <i class="icon-cogs pull-right"> </i>'
    analytics.track('Clicked disabled', {id: event.srcElement.id})

Template.contributor.rendered = ->
  $('.technology-logo-small[rel=tooltip]').tooltip()

Template.contributor.destroyed = ->
  $('.technology-logo-small[rel=tooltip]').tooltip('hide')
