require 'ffi'

module C
  extend FFI::Library

  ffi_lib File.expand_path('../c/lib.so', __dir__)

  attach_function :fibonacci, [:uint8], :uint64
end

RSpec.describe 'fibonacci' do
  it 'returns fibonacci number' do
    expect(C.fibonacci(6)).to eq(8)
  end
end
