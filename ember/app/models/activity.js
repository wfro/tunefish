import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  artist: DS.attr('string'),
  url: DS.attr('string'),
  provider: DS.attr('string')
});