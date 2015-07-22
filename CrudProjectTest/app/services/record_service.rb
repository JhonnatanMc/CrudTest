class RecordService
  
  def self.index
    @records = Record.all
  end
  
  def self.newRecord
       @record = Record.new
  end
  
  def self.create(record_params)
      @record = Record.new(record_params)
      if @record.save
        @record
     end   
  end
  
  def self.destroy
    @record.destroy
  end
  
  
end