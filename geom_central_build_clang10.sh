# Ubuntu 20.04: clang-10
# Ubuntu 22.04: clang-11/12/13
#sudo apt update
#sudo apt install libc++-dev
#sudo apt install libc++abi-dev
mkdir -p build
pushd build

cmake .. -G Ninja \
      -DCMAKE_C_COMPILER:STRING=clang-10 -DCMAKE_CXX_COMPILER:STRING=clang++-10 \
		  -DCMAKE_INSTALL_PREFIX=../release \
		  -DCMAKE_CXX_FLAGS:STRING="-stdlib=libc++" \
		  -DCMAKE_EXE_LINKER_FLAGS:STRING="-Wl,--no-as-needed -stdlib=libc++" \
		  -DCMAKE_BUILD_TYPE:STRING=Release
cmake --build . -j16
cmake --install .
popd
