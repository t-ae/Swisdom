# Message Sepcifications

## Close

```
{
    "win": "win_id",
    "eid": "env_id"
}
```

## Scatter

```
{
    "data": [
        {
            "x": [Double],
            "y": [Double],
            "name": String,
            "type": "scatter or scatter3d",
            "mode": "marker" or "lines" or "lines+marker"
        },
        ...
    ],
    "win": "win_id",
    "eid": "env_id",
    "layout": ,
    "opts": {
        "fillarea": true,
        "colormap": "Viridis",
        "markers": false,
        "markersymbol": dot,
        "markersize": 10,
        "legend": []
    }
}
```

