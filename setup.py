import setuptools, os

with open("README.md", "r") as fh:
    long_description = fh.read()

def package_files(directory):
    paths = []
    for (path, directories, filenames) in os.walk(directory):
        temp_path = []
        for filename in filenames:
            temp_path.append(os.path.join('.', path, filename))
        paths.append( (os.path.join('.', path), temp_path) )

    return paths

extra_files = package_files(os.path.dirname(__file__).join("FastDownward/builds/"))

setuptools.setup(
    name="pddlStream", # Replace with your own username
    version="0.0.1",
    author="Caelan Garrett",
    description="Python fast downward PDDL stream API",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/nobodyczcz/pddlstream",
    packages=setuptools.find_packages(exclude=["./examples"]),
    include_package_data=True,
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    data_files=extra_files,
)