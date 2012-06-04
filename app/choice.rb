class Choice < NanoStore::Model
  attribute :value
  Choice.store = NanoStore.store(:memory)


  def initialize(value)
    @value = value
  end

  All = [Choice.create(:value => 'Choice1'),
         Choice.create(:value => 'Choice2') ,
         Choice.create(:value => 'Choice3')
        ]

end

