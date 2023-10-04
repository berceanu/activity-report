# activity-report
[Typst](https://github.com/typst/typst)-based template for activity reports.

## Usage

```
# produces usage.pdf
$ typst compile usage.typ
```

In case you have old printer drivers, rasterize the PDF file via

```
# produces usage.raster.pdf
$ bash rasterizepdf.sh usage.pdf 
```
