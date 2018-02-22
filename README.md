# Xyce Dependency Build
-
Xyce, the high performance analog circuit simulator is obnoxiously hard to build. For those that just want to hit the ground running, I have created a dockerfile and a few bash scripts that can build all of the dependencies in a conveniently packaged and pre build docker image.

#### Caveat: You still need to get the Xyce Source. I believe it has export restrictions.

Xyce has several dependencies, thoroughly documented on their site. These include:

 - CMake
 - HDF5
 - NetCDF
 - Trilinos

Some of these have options for parallel distributions for MPI implementations. For the purposes of this image, I have built both the serial and parallel versions of the softwares.

There is also a script for actually building Xyce once you've obtained a tar.gz

Travis confirms that the image builds and is available on docker hub, all you need to do is get a Xyce distribution.
